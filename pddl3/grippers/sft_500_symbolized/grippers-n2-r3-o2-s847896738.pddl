(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_3
obj_10 obj_02 obj_04 obj_05 - type_1
obj_11 obj_07 obj_01 - type_2
obj_03 obj_08 - object)
(:init
(pred_4 obj_09 obj_01)
(pred_2 obj_09 obj_10)
(pred_2 obj_09 obj_02)
(pred_4 obj_06 obj_01)
(pred_2 obj_06 obj_04)
(pred_2 obj_06 obj_05)
(pred_3 obj_03 obj_11)
(pred_3 obj_08 obj_07)
)
(:goal
(and
(pred_3 obj_03 obj_01)
(pred_3 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_11)))
)
)