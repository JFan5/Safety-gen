(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_09 - type_3
obj_10 obj_12 obj_08 obj_05 - type_2
obj_03 obj_06 obj_11 obj_07 - type_1
obj_02 obj_04 obj_01 - object)
(:init
(pred_2 obj_13 obj_11)
(pred_1 obj_13 obj_10)
(pred_1 obj_13 obj_12)
(pred_2 obj_09 obj_06)
(pred_1 obj_09 obj_08)
(pred_1 obj_09 obj_05)
(pred_3 obj_02 obj_06)
(pred_3 obj_04 obj_11)
(pred_3 obj_01 obj_03)
)
(:goal
(and
(pred_3 obj_02 obj_07)
(pred_3 obj_04 obj_07)
(pred_3 obj_01 obj_07)
)
)

(:constraints
  (always (not (pred_2 obj_13 obj_07)))
)
)