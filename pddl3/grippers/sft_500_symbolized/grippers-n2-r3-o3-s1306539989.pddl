(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_04 - type_2
obj_03 obj_09 obj_06 obj_12 - type_3
obj_05 obj_10 obj_02 - type_1
obj_01 obj_07 obj_08 - object)
(:init
(pred_1 obj_11 obj_02)
(pred_4 obj_11 obj_03)
(pred_4 obj_11 obj_09)
(pred_1 obj_04 obj_10)
(pred_4 obj_04 obj_06)
(pred_4 obj_04 obj_12)
(pred_3 obj_01 obj_10)
(pred_3 obj_07 obj_10)
(pred_3 obj_08 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_02)
(pred_3 obj_07 obj_02)
(pred_3 obj_08 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_02) (pred_1 obj_04 obj_02))))
  )
)
)