(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_09 - type_2
obj_02 obj_13 obj_06 obj_01 - type_1
obj_04 obj_11 obj_07 obj_12 - type_3
obj_03 obj_05 obj_10 obj_08 - object)
(:init
(pred_3 obj_14 obj_12)
(pred_1 obj_14 obj_02)
(pred_1 obj_14 obj_13)
(pred_3 obj_09 obj_07)
(pred_1 obj_09 obj_06)
(pred_1 obj_09 obj_01)
(pred_4 obj_03 obj_12)
(pred_4 obj_05 obj_11)
(pred_4 obj_10 obj_07)
(pred_4 obj_08 obj_11)
)
(:goal
(and
(pred_4 obj_03 obj_07)
(pred_4 obj_05 obj_11)
(pred_4 obj_10 obj_04)
(pred_4 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_14 obj_07)))
)
)