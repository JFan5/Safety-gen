(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_1
obj_03 obj_07 obj_08 obj_05 - type_3
obj_10 obj_09 obj_06 - type_2
obj_04 obj_12 obj_02 - object)
(:init
(pred_4 obj_11 obj_06)
(pred_2 obj_11 obj_03)
(pred_2 obj_11 obj_07)
(pred_4 obj_01 obj_10)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_05)
(pred_3 obj_04 obj_06)
(pred_3 obj_12 obj_10)
(pred_3 obj_02 obj_09)
)
(:goal
(and
(pred_3 obj_04 obj_10)
(pred_3 obj_12 obj_06)
(pred_3 obj_02 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_11 obj_06) (pred_4 obj_01 obj_06))))
  )
)
)