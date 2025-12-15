(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_06 - type_1
obj_10 obj_07 obj_08 obj_04 - type_3
obj_03 obj_01 obj_05 - type_2
obj_09 obj_11 obj_02 - object)
(:init
(pred_3 obj_12 obj_03)
(pred_4 obj_12 obj_10)
(pred_4 obj_12 obj_07)
(pred_3 obj_06 obj_05)
(pred_4 obj_06 obj_08)
(pred_4 obj_06 obj_04)
(pred_2 obj_09 obj_01)
(pred_2 obj_11 obj_01)
(pred_2 obj_02 obj_03)
)
(:goal
(and
(pred_2 obj_09 obj_03)
(pred_2 obj_11 obj_03)
(pred_2 obj_02 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_05)))
)
)