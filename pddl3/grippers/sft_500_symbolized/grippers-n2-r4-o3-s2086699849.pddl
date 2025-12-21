(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_1
obj_13 obj_01 obj_03 obj_02 - type_2
obj_04 obj_07 obj_09 obj_06 - type_3
obj_12 obj_10 obj_11 - object)
(:init
(pred_1 obj_05 obj_07)
(pred_3 obj_05 obj_13)
(pred_3 obj_05 obj_01)
(pred_1 obj_08 obj_09)
(pred_3 obj_08 obj_03)
(pred_3 obj_08 obj_02)
(pred_2 obj_12 obj_06)
(pred_2 obj_10 obj_06)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_12 obj_07)
(pred_2 obj_10 obj_07)
(pred_2 obj_11 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_06) (pred_1 obj_08 obj_06))))
  )
)
)