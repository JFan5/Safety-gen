(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_13 - type_1
obj_09 obj_03 obj_06 obj_12 - type_2
obj_11 obj_10 obj_07 obj_02 - type_3
obj_04 obj_05 obj_01 - object)
(:init
(pred_3 obj_08 obj_11)
(pred_2 obj_08 obj_09)
(pred_2 obj_08 obj_03)
(pred_3 obj_13 obj_10)
(pred_2 obj_13 obj_06)
(pred_2 obj_13 obj_12)
(pred_4 obj_04 obj_11)
(pred_4 obj_05 obj_11)
(pred_4 obj_01 obj_02)
)
(:goal
(and
(pred_4 obj_04 obj_07)
(pred_4 obj_05 obj_10)
(pred_4 obj_01 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_07)))
)
)