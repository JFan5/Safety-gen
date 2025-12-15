(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_01 - type_3
obj_09 obj_07 obj_06 obj_02 - type_2
obj_05 obj_08 obj_12 - type_1
obj_11 obj_10 obj_03 - object)
(:init
(pred_2 obj_04 obj_08)
(pred_4 obj_04 obj_09)
(pred_4 obj_04 obj_07)
(pred_2 obj_01 obj_05)
(pred_4 obj_01 obj_06)
(pred_4 obj_01 obj_02)
(pred_3 obj_11 obj_12)
(pred_3 obj_10 obj_05)
(pred_3 obj_03 obj_12)
)
(:goal
(and
(pred_3 obj_11 obj_05)
(pred_3 obj_10 obj_05)
(pred_3 obj_03 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_04 obj_12) (pred_2 obj_01 obj_12))))
  )
)
)