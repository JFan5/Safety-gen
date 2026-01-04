(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_02 obj_11 obj_10 obj_09 - type_2
obj_06 obj_08 obj_03 - type_3
obj_04 obj_05 - object)
(:init
(pred_3 obj_07 obj_03)
(pred_4 obj_07 obj_02)
(pred_4 obj_07 obj_11)
(pred_3 obj_01 obj_03)
(pred_4 obj_01 obj_10)
(pred_4 obj_01 obj_09)
(pred_2 obj_04 obj_08)
(pred_2 obj_05 obj_03)
)
(:goal
(and
(pred_2 obj_04 obj_08)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_08)))
)
)