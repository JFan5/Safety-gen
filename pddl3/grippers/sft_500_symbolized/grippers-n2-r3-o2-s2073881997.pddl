(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_2
obj_02 obj_01 obj_10 obj_08 - type_1
obj_09 obj_03 obj_07 - type_3
obj_11 obj_04 - object)
(:init
(pred_1 obj_06 obj_07)
(pred_2 obj_06 obj_02)
(pred_2 obj_06 obj_01)
(pred_1 obj_05 obj_07)
(pred_2 obj_05 obj_10)
(pred_2 obj_05 obj_08)
(pred_3 obj_11 obj_03)
(pred_3 obj_04 obj_03)
)
(:goal
(and
(pred_3 obj_11 obj_03)
(pred_3 obj_04 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_03)))
)
)