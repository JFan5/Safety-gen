(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_2
obj_10 obj_07 obj_02 obj_01 - type_3
obj_05 obj_08 obj_04 obj_11 - type_1
obj_13 obj_06 obj_14 obj_12 - object)
(:init
(pred_2 obj_03 obj_11)
(pred_1 obj_03 obj_10)
(pred_1 obj_03 obj_07)
(pred_2 obj_09 obj_04)
(pred_1 obj_09 obj_02)
(pred_1 obj_09 obj_01)
(pred_3 obj_13 obj_04)
(pred_3 obj_06 obj_04)
(pred_3 obj_14 obj_11)
(pred_3 obj_12 obj_08)
)
(:goal
(and
(pred_3 obj_13 obj_11)
(pred_3 obj_06 obj_11)
(pred_3 obj_14 obj_08)
(pred_3 obj_12 obj_04)
)
)

(:constraints
  (always (not (pred_2 obj_03 obj_04)))
)
)