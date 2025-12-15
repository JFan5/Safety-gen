(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_08 - type_1
obj_06 obj_09 obj_10 obj_12 - type_3
obj_13 obj_02 obj_07 obj_11 - type_2
obj_05 obj_04 obj_01 - object)
(:init
(pred_3 obj_03 obj_13)
(pred_4 obj_03 obj_06)
(pred_4 obj_03 obj_09)
(pred_3 obj_08 obj_02)
(pred_4 obj_08 obj_10)
(pred_4 obj_08 obj_12)
(pred_2 obj_05 obj_07)
(pred_2 obj_04 obj_11)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_05 obj_11)
(pred_2 obj_04 obj_11)
(pred_2 obj_01 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_11) (pred_3 obj_08 obj_11))))
  )
)
)