(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_1
obj_12 obj_10 obj_06 obj_03 - type_3
obj_13 obj_01 obj_04 obj_08 - type_2
obj_11 obj_05 obj_14 obj_09 - object)
(:init
(pred_1 obj_07 obj_01)
(pred_2 obj_07 obj_12)
(pred_2 obj_07 obj_10)
(pred_1 obj_02 obj_08)
(pred_2 obj_02 obj_06)
(pred_2 obj_02 obj_03)
(pred_4 obj_11 obj_08)
(pred_4 obj_05 obj_13)
(pred_4 obj_14 obj_08)
(pred_4 obj_09 obj_08)
)
(:goal
(and
(pred_4 obj_11 obj_04)
(pred_4 obj_05 obj_08)
(pred_4 obj_14 obj_01)
(pred_4 obj_09 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_04)))
)
)