(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_1
obj_07 obj_11 obj_03 obj_05 - type_3
obj_06 obj_10 obj_04 - type_2
obj_02 obj_09 obj_08 - object)
(:init
(pred_4 obj_12 obj_06)
(pred_2 obj_12 obj_07)
(pred_2 obj_12 obj_11)
(pred_4 obj_01 obj_06)
(pred_2 obj_01 obj_03)
(pred_2 obj_01 obj_05)
(pred_3 obj_02 obj_06)
(pred_3 obj_09 obj_10)
(pred_3 obj_08 obj_04)
)
(:goal
(and
(pred_3 obj_02 obj_06)
(pred_3 obj_09 obj_06)
(pred_3 obj_08 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_04)))
)
)