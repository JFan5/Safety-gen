(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_1
obj_11 obj_02 obj_09 obj_03 - type_3
obj_07 obj_12 obj_05 - type_2
obj_01 obj_06 obj_08 - object)
(:init
(pred_4 obj_10 obj_12)
(pred_2 obj_10 obj_11)
(pred_2 obj_10 obj_02)
(pred_4 obj_04 obj_05)
(pred_2 obj_04 obj_09)
(pred_2 obj_04 obj_03)
(pred_3 obj_01 obj_07)
(pred_3 obj_06 obj_05)
(pred_3 obj_08 obj_07)
)
(:goal
(and
(pred_3 obj_01 obj_05)
(pred_3 obj_06 obj_07)
(pred_3 obj_08 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_05) (pred_4 obj_04 obj_05))))
  )
)
)