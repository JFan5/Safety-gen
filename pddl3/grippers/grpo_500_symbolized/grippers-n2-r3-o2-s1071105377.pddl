(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_1
obj_02 obj_07 obj_06 obj_04 - type_3
obj_03 obj_05 obj_11 - type_2
obj_01 obj_09 - object)
(:init
(pred_4 obj_10 obj_03)
(pred_2 obj_10 obj_02)
(pred_2 obj_10 obj_07)
(pred_4 obj_08 obj_03)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_04)
(pred_3 obj_01 obj_03)
(pred_3 obj_09 obj_11)
)
(:goal
(and
(pred_3 obj_01 obj_05)
(pred_3 obj_09 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_11)))
)
)