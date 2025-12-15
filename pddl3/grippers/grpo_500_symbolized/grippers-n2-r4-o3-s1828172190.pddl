(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_12 obj_09 obj_02 obj_04 - type_3
obj_07 obj_13 obj_11 obj_05 - type_2
obj_10 obj_06 obj_03 - object)
(:init
(pred_3 obj_08 obj_07)
(pred_4 obj_08 obj_12)
(pred_4 obj_08 obj_09)
(pred_3 obj_01 obj_13)
(pred_4 obj_01 obj_02)
(pred_4 obj_01 obj_04)
(pred_2 obj_10 obj_11)
(pred_2 obj_06 obj_07)
(pred_2 obj_03 obj_07)
)
(:goal
(and
(pred_2 obj_10 obj_05)
(pred_2 obj_06 obj_05)
(pred_2 obj_03 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_05) (pred_3 obj_01 obj_05))))
  )
)
)