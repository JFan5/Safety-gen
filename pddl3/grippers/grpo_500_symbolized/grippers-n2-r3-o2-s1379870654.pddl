(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_09 obj_01 obj_10 obj_03 - type_3
obj_05 obj_11 obj_04 - type_2
obj_02 obj_06 - object)
(:init
(pred_4 obj_08 obj_04)
(pred_2 obj_08 obj_09)
(pred_2 obj_08 obj_01)
(pred_4 obj_07 obj_04)
(pred_2 obj_07 obj_10)
(pred_2 obj_07 obj_03)
(pred_3 obj_02 obj_04)
(pred_3 obj_06 obj_05)
)
(:goal
(and
(pred_3 obj_02 obj_05)
(pred_3 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_05)))
)
)