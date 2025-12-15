(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_12 - type_1
obj_04 obj_02 obj_03 obj_10 - type_3
obj_06 obj_11 obj_07 - type_2
obj_05 obj_09 obj_08 - object)
(:init
(pred_3 obj_01 obj_11)
(pred_4 obj_01 obj_04)
(pred_4 obj_01 obj_02)
(pred_3 obj_12 obj_06)
(pred_4 obj_12 obj_03)
(pred_4 obj_12 obj_10)
(pred_2 obj_05 obj_06)
(pred_2 obj_09 obj_11)
(pred_2 obj_08 obj_11)
)
(:goal
(and
(pred_2 obj_05 obj_07)
(pred_2 obj_09 obj_07)
(pred_2 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_07)))
)
)