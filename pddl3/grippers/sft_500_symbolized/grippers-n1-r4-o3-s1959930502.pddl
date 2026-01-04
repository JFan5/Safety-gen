(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_07 obj_04 - type_2
obj_09 obj_03 obj_08 obj_01 - type_3
obj_06 obj_02 obj_05 - object)
(:init
(pred_4 obj_10 obj_03)
(pred_2 obj_10 obj_07)
(pred_2 obj_10 obj_04)
(pred_1 obj_06 obj_09)
(pred_1 obj_02 obj_01)
(pred_1 obj_05 obj_08)
)
(:goal
(and
(pred_1 obj_06 obj_09)
(pred_1 obj_02 obj_03)
(pred_1 obj_05 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_10 ?b obj_07))))
)
)