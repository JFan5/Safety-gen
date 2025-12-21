(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_04 - type_1
obj_05 obj_11 obj_06 obj_07 - type_2
obj_10 obj_02 obj_08 - type_3
obj_01 obj_03 - object)
(:init
(pred_1 obj_09 obj_10)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_11)
(pred_1 obj_04 obj_10)
(pred_3 obj_04 obj_06)
(pred_3 obj_04 obj_07)
(pred_2 obj_01 obj_02)
(pred_2 obj_03 obj_02)
)
(:goal
(and
(pred_2 obj_01 obj_08)
(pred_2 obj_03 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_08)))
)
)