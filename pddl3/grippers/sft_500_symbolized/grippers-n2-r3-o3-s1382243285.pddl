(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_2
obj_04 obj_03 obj_12 obj_07 - type_3
obj_05 obj_10 obj_08 - type_1
obj_09 obj_01 obj_11 - object)
(:init
(pred_3 obj_06 obj_08)
(pred_2 obj_06 obj_04)
(pred_2 obj_06 obj_03)
(pred_3 obj_02 obj_08)
(pred_2 obj_02 obj_12)
(pred_2 obj_02 obj_07)
(pred_4 obj_09 obj_05)
(pred_4 obj_01 obj_10)
(pred_4 obj_11 obj_08)
)
(:goal
(and
(pred_4 obj_09 obj_05)
(pred_4 obj_01 obj_05)
(pred_4 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_10)))
)
)