(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_09 - type_2
obj_07 obj_08 obj_05 obj_12 - type_1
obj_06 obj_04 obj_10 - type_3
obj_03 obj_11 obj_01 - object)
(:init
(pred_3 obj_02 obj_06)
(pred_2 obj_02 obj_07)
(pred_2 obj_02 obj_08)
(pred_3 obj_09 obj_06)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_12)
(pred_4 obj_03 obj_10)
(pred_4 obj_11 obj_10)
(pred_4 obj_01 obj_04)
)
(:goal
(and
(pred_4 obj_03 obj_10)
(pred_4 obj_11 obj_04)
(pred_4 obj_01 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_10)))
)
)