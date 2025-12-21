(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_10 obj_11 obj_03 obj_04 - type_3
obj_07 obj_05 obj_08 - type_2
obj_06 obj_02 - object)
(:init
(pred_4 obj_09 obj_05)
(pred_2 obj_09 obj_10)
(pred_2 obj_09 obj_11)
(pred_4 obj_01 obj_05)
(pred_2 obj_01 obj_03)
(pred_2 obj_01 obj_04)
(pred_3 obj_06 obj_07)
(pred_3 obj_02 obj_08)
)
(:goal
(and
(pred_3 obj_06 obj_05)
(pred_3 obj_02 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_08)))
)
)