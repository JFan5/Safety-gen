(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_07 obj_03 obj_11 obj_10 - type_3
obj_04 obj_02 obj_08 - type_2
obj_09 obj_06 - object)
(:init
(pred_4 obj_01 obj_08)
(pred_2 obj_01 obj_07)
(pred_2 obj_01 obj_03)
(pred_4 obj_05 obj_08)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_10)
(pred_3 obj_09 obj_02)
(pred_3 obj_06 obj_02)
)
(:goal
(and
(pred_3 obj_09 obj_02)
(pred_3 obj_06 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_02)))
)
)