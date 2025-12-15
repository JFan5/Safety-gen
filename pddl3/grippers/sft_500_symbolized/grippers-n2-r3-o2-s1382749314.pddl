(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_09 - type_3
obj_02 obj_10 obj_05 obj_06 - type_1
obj_01 obj_04 obj_11 - type_2
obj_07 obj_03 - object)
(:init
(pred_4 obj_08 obj_01)
(pred_3 obj_08 obj_02)
(pred_3 obj_08 obj_10)
(pred_4 obj_09 obj_01)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_06)
(pred_2 obj_07 obj_04)
(pred_2 obj_03 obj_04)
)
(:goal
(and
(pred_2 obj_07 obj_11)
(pred_2 obj_03 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_11)))
)
)