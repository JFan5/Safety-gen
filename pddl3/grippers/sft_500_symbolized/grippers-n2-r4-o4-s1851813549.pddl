(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_08 - type_3
obj_10 obj_13 obj_11 obj_12 - type_1
obj_06 obj_05 obj_03 obj_01 - type_2
obj_14 obj_07 obj_04 obj_02 - object)
(:init
(pred_2 obj_09 obj_03)
(pred_1 obj_09 obj_10)
(pred_1 obj_09 obj_13)
(pred_2 obj_08 obj_03)
(pred_1 obj_08 obj_11)
(pred_1 obj_08 obj_12)
(pred_4 obj_14 obj_06)
(pred_4 obj_07 obj_06)
(pred_4 obj_04 obj_06)
(pred_4 obj_02 obj_01)
)
(:goal
(and
(pred_4 obj_14 obj_06)
(pred_4 obj_07 obj_06)
(pred_4 obj_04 obj_03)
(pred_4 obj_02 obj_05)
)
)

(:constraints
  (always (not (pred_2 obj_09 obj_01)))
)
)