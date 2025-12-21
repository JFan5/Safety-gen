(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_01 - type_1
obj_09 obj_10 obj_02 obj_04 - type_3
obj_05 obj_06 obj_11 - type_2
obj_07 obj_08 - object)
(:init
(pred_4 obj_03 obj_06)
(pred_2 obj_03 obj_09)
(pred_2 obj_03 obj_10)
(pred_4 obj_01 obj_06)
(pred_2 obj_01 obj_02)
(pred_2 obj_01 obj_04)
(pred_3 obj_07 obj_06)
(pred_3 obj_08 obj_11)
)
(:goal
(and
(pred_3 obj_07 obj_11)
(pred_3 obj_08 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_11)))
)
)