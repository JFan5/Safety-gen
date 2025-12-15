(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_1
obj_05 obj_04 obj_03 obj_11 - type_3
obj_12 obj_08 obj_10 - type_2
obj_09 obj_01 obj_06 - object)
(:init
(pred_3 obj_07 obj_08)
(pred_4 obj_07 obj_05)
(pred_4 obj_07 obj_04)
(pred_3 obj_02 obj_12)
(pred_4 obj_02 obj_03)
(pred_4 obj_02 obj_11)
(pred_2 obj_09 obj_12)
(pred_2 obj_01 obj_08)
(pred_2 obj_06 obj_12)
)
(:goal
(and
(pred_2 obj_09 obj_12)
(pred_2 obj_01 obj_10)
(pred_2 obj_06 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_10)))
)
)