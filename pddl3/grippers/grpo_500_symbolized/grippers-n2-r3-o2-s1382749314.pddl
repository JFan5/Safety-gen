(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_10 - type_1
obj_01 obj_03 obj_04 obj_06 - type_3
obj_11 obj_02 obj_08 - type_2
obj_07 obj_05 - object)
(:init
(pred_3 obj_09 obj_11)
(pred_4 obj_09 obj_01)
(pred_4 obj_09 obj_03)
(pred_3 obj_10 obj_11)
(pred_4 obj_10 obj_04)
(pred_4 obj_10 obj_06)
(pred_2 obj_07 obj_02)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_07 obj_08)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_08)))
)
)