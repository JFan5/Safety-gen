(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_2
obj_06 obj_07 - type_3
obj_08 obj_04 obj_03 - type_1
obj_09 obj_01 obj_02 - object)
(:init
(pred_2 obj_05 obj_04)
(pred_1 obj_05 obj_06)
(pred_1 obj_05 obj_07)
(pred_3 obj_09 obj_04)
(pred_3 obj_01 obj_04)
(pred_3 obj_02 obj_03)
)
(:goal
(and
(pred_3 obj_09 obj_04)
(pred_3 obj_01 obj_04)
(pred_3 obj_02 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_07))))
)
)