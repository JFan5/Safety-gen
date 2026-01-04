(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_01 obj_08 - type_1
obj_05 obj_07 obj_04 obj_10 - type_3
obj_03 obj_11 obj_02 - type_2
obj_06 obj_09 - object)
(:init
(pred_2 obj_01 obj_03)
(pred_1 obj_01 obj_05)
(pred_1 obj_01 obj_07)
(pred_2 obj_08 obj_03)
(pred_1 obj_08 obj_04)
(pred_1 obj_08 obj_10)
(pred_4 obj_06 obj_11)
(pred_4 obj_09 obj_11)
)
(:goal
(and
(pred_4 obj_06 obj_02)
(pred_4 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_02)))
)
)