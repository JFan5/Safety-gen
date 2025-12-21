(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_1
obj_07 obj_01 obj_10 obj_09 - type_3
obj_03 obj_11 obj_04 - type_2
obj_06 obj_08 - object)
(:init
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_07)
(pred_2 obj_05 obj_01)
(pred_4 obj_02 obj_04)
(pred_2 obj_02 obj_10)
(pred_2 obj_02 obj_09)
(pred_3 obj_06 obj_11)
(pred_3 obj_08 obj_11)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_08 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_04)))
)
)