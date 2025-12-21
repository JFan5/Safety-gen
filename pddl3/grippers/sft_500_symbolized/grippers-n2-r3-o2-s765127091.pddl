(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_1
obj_01 obj_07 obj_09 obj_11 - type_2
obj_05 obj_06 obj_04 - type_3
obj_08 obj_10 - object)
(:init
(pred_1 obj_02 obj_06)
(pred_3 obj_02 obj_01)
(pred_3 obj_02 obj_07)
(pred_1 obj_03 obj_04)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_11)
(pred_2 obj_08 obj_06)
(pred_2 obj_10 obj_06)
)
(:goal
(and
(pred_2 obj_08 obj_04)
(pred_2 obj_10 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_04)))
)
)