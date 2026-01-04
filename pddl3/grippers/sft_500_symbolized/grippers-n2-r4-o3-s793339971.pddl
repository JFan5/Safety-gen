(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_10 - type_1
obj_12 obj_09 obj_06 obj_02 - type_3
obj_13 obj_11 obj_07 obj_05 - type_2
obj_08 obj_03 obj_04 - object)
(:init
(pred_3 obj_01 obj_05)
(pred_1 obj_01 obj_12)
(pred_1 obj_01 obj_09)
(pred_3 obj_10 obj_11)
(pred_1 obj_10 obj_06)
(pred_1 obj_10 obj_02)
(pred_2 obj_08 obj_07)
(pred_2 obj_03 obj_13)
(pred_2 obj_04 obj_07)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_03 obj_13)
(pred_2 obj_04 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_05) (pred_3 obj_10 obj_05))))
  )
)
)