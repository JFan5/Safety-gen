(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_1
obj_13 obj_07 obj_01 obj_12 - type_3
obj_09 obj_08 obj_02 obj_11 - type_2
obj_10 obj_04 obj_03 - object)
(:init
(pred_4 obj_06 obj_08)
(pred_2 obj_06 obj_13)
(pred_2 obj_06 obj_07)
(pred_4 obj_05 obj_09)
(pred_2 obj_05 obj_01)
(pred_2 obj_05 obj_12)
(pred_3 obj_10 obj_02)
(pred_3 obj_04 obj_11)
(pred_3 obj_03 obj_09)
)
(:goal
(and
(pred_3 obj_10 obj_11)
(pred_3 obj_04 obj_11)
(pred_3 obj_03 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_11) (pred_4 obj_05 obj_11))))
  )
)
)