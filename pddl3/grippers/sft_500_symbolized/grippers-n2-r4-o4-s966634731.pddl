(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_09 - type_1
obj_11 obj_10 obj_13 obj_07 - type_3
obj_04 obj_03 obj_08 obj_01 - type_2
obj_14 obj_06 obj_05 obj_12 - object)
(:init
(pred_3 obj_02 obj_04)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_10)
(pred_3 obj_09 obj_04)
(pred_2 obj_09 obj_13)
(pred_2 obj_09 obj_07)
(pred_1 obj_14 obj_08)
(pred_1 obj_06 obj_01)
(pred_1 obj_05 obj_03)
(pred_1 obj_12 obj_08)
)
(:goal
(and
(pred_1 obj_14 obj_01)
(pred_1 obj_06 obj_03)
(pred_1 obj_05 obj_08)
(pred_1 obj_12 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_08)))
)
)