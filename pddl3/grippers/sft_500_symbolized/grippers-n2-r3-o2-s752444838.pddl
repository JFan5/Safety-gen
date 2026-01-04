(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_2
obj_03 obj_02 obj_05 obj_10 - type_1
obj_04 obj_01 obj_08 - type_3
obj_06 obj_07 - object)
(:init
(pred_1 obj_11 obj_01)
(pred_2 obj_11 obj_03)
(pred_2 obj_11 obj_02)
(pred_1 obj_09 obj_01)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_10)
(pred_4 obj_06 obj_01)
(pred_4 obj_07 obj_08)
)
(:goal
(and
(pred_4 obj_06 obj_01)
(pred_4 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_08)))
)
)