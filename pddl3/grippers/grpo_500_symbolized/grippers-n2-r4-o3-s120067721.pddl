(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_07 obj_05 obj_12 obj_10 - type_3
obj_13 obj_08 obj_03 obj_01 - type_2
obj_02 obj_06 obj_04 - object)
(:init
(pred_4 obj_11 obj_03)
(pred_2 obj_11 obj_07)
(pred_2 obj_11 obj_05)
(pred_4 obj_09 obj_03)
(pred_2 obj_09 obj_12)
(pred_2 obj_09 obj_10)
(pred_3 obj_02 obj_08)
(pred_3 obj_06 obj_03)
(pred_3 obj_04 obj_01)
)
(:goal
(and
(pred_3 obj_02 obj_03)
(pred_3 obj_06 obj_03)
(pred_3 obj_04 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_01)))
)
)