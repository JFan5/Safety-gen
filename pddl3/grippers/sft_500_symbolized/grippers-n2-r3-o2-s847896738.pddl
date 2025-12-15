(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_2
obj_03 obj_04 obj_05 obj_02 - type_1
obj_06 obj_08 obj_11 - type_3
obj_10 obj_09 - object)
(:init
(pred_3 obj_07 obj_11)
(pred_1 obj_07 obj_03)
(pred_1 obj_07 obj_04)
(pred_3 obj_01 obj_11)
(pred_1 obj_01 obj_05)
(pred_1 obj_01 obj_02)
(pred_4 obj_10 obj_06)
(pred_4 obj_09 obj_08)
)
(:goal
(and
(pred_4 obj_10 obj_11)
(pred_4 obj_09 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_06)))
)
)