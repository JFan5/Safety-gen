(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_2
obj_02 obj_09 obj_10 obj_04 - type_1
obj_05 obj_03 obj_08 obj_11 - type_3
obj_13 obj_06 obj_12 - object)
(:init
(pred_4 obj_07 obj_08)
(pred_2 obj_07 obj_02)
(pred_2 obj_07 obj_09)
(pred_4 obj_01 obj_11)
(pred_2 obj_01 obj_10)
(pred_2 obj_01 obj_04)
(pred_1 obj_13 obj_08)
(pred_1 obj_06 obj_05)
(pred_1 obj_12 obj_05)
)
(:goal
(and
(pred_1 obj_13 obj_11)
(pred_1 obj_06 obj_08)
(pred_1 obj_12 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_11) (pred_4 obj_01 obj_11))))
  )
)
)