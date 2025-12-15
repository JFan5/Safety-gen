(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_1
obj_07 obj_10 obj_09 obj_08 - type_3
obj_04 obj_05 obj_02 - type_2
obj_06 obj_01 - object)
(:init
(pred_3 obj_11 obj_02)
(pred_4 obj_11 obj_07)
(pred_4 obj_11 obj_10)
(pred_3 obj_03 obj_02)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_08)
(pred_2 obj_06 obj_02)
(pred_2 obj_01 obj_04)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_01 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_04)))
)
)