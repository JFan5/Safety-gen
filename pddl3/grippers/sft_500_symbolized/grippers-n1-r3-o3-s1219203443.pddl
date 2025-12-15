(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_03 obj_07 - type_1
obj_08 obj_04 obj_09 - type_3
obj_01 obj_06 obj_05 - object)
(:init
(pred_2 obj_02 obj_09)
(pred_1 obj_02 obj_03)
(pred_1 obj_02 obj_07)
(pred_4 obj_01 obj_08)
(pred_4 obj_06 obj_09)
(pred_4 obj_05 obj_08)
)
(:goal
(and
(pred_4 obj_01 obj_04)
(pred_4 obj_06 obj_09)
(pred_4 obj_05 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_02 ?b obj_07))))
)
)