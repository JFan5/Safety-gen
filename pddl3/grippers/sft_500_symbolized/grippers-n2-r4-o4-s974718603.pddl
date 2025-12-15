(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_09 - type_1
obj_07 obj_04 obj_14 obj_12 - type_2
obj_10 obj_03 obj_01 obj_13 - type_3
obj_06 obj_08 obj_05 obj_11 - object)
(:init
(pred_2 obj_02 obj_03)
(pred_1 obj_02 obj_07)
(pred_1 obj_02 obj_04)
(pred_2 obj_09 obj_03)
(pred_1 obj_09 obj_14)
(pred_1 obj_09 obj_12)
(pred_3 obj_06 obj_03)
(pred_3 obj_08 obj_01)
(pred_3 obj_05 obj_13)
(pred_3 obj_11 obj_03)
)
(:goal
(and
(pred_3 obj_06 obj_10)
(pred_3 obj_08 obj_03)
(pred_3 obj_05 obj_03)
(pred_3 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_01)))
)
)