(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_06 obj_03 obj_08 obj_10 - type_3
obj_07 obj_11 obj_02 - type_2
obj_05 obj_04 - object)
(:init
(pred_4 obj_09 obj_11)
(pred_2 obj_09 obj_06)
(pred_2 obj_09 obj_03)
(pred_4 obj_01 obj_11)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_10)
(pred_3 obj_05 obj_11)
(pred_3 obj_04 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_11)
(pred_3 obj_04 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_02)))
)
)