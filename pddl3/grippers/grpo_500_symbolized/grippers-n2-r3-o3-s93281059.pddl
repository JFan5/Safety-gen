(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_12 obj_08 obj_03 obj_05 - type_3
obj_04 obj_11 obj_07 - type_2
obj_06 obj_09 obj_02 - object)
(:init
(pred_4 obj_10 obj_07)
(pred_2 obj_10 obj_12)
(pred_2 obj_10 obj_08)
(pred_4 obj_01 obj_04)
(pred_2 obj_01 obj_03)
(pred_2 obj_01 obj_05)
(pred_3 obj_06 obj_07)
(pred_3 obj_09 obj_04)
(pred_3 obj_02 obj_04)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_09 obj_04)
(pred_3 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_04)))
)
)