(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_12 - type_1
obj_04 obj_09 obj_02 obj_07 - type_3
obj_08 obj_01 obj_13 obj_11 - type_2
obj_06 obj_03 obj_10 obj_05 - object)
(:init
(pred_3 obj_14 obj_01)
(pred_4 obj_14 obj_04)
(pred_4 obj_14 obj_09)
(pred_3 obj_12 obj_08)
(pred_4 obj_12 obj_02)
(pred_4 obj_12 obj_07)
(pred_2 obj_06 obj_08)
(pred_2 obj_03 obj_08)
(pred_2 obj_10 obj_13)
(pred_2 obj_05 obj_08)
)
(:goal
(and
(pred_2 obj_06 obj_08)
(pred_2 obj_03 obj_13)
(pred_2 obj_10 obj_11)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_14 obj_11) (pred_3 obj_12 obj_11))))
  )
)
)