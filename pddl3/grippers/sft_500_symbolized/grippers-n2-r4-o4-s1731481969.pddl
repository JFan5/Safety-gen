(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_08 - type_1
obj_12 obj_01 obj_02 obj_06 - type_2
obj_13 obj_10 obj_04 obj_03 - type_3
obj_09 obj_07 obj_14 obj_05 - object)
(:init
(pred_1 obj_11 obj_13)
(pred_3 obj_11 obj_12)
(pred_3 obj_11 obj_01)
(pred_1 obj_08 obj_10)
(pred_3 obj_08 obj_02)
(pred_3 obj_08 obj_06)
(pred_4 obj_09 obj_04)
(pred_4 obj_07 obj_04)
(pred_4 obj_14 obj_10)
(pred_4 obj_05 obj_04)
)
(:goal
(and
(pred_4 obj_09 obj_03)
(pred_4 obj_07 obj_13)
(pred_4 obj_14 obj_04)
(pred_4 obj_05 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_04)))
)
)