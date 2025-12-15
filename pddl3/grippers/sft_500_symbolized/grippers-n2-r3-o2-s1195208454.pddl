(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_3
obj_10 obj_01 obj_11 obj_03 - type_2
obj_02 obj_07 obj_04 - type_1
obj_06 obj_09 - object)
(:init
(pred_1 obj_05 obj_07)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_01)
(pred_1 obj_08 obj_07)
(pred_4 obj_08 obj_11)
(pred_4 obj_08 obj_03)
(pred_2 obj_06 obj_02)
(pred_2 obj_09 obj_04)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_04)))
)
)