(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_2
obj_09 obj_13 obj_02 obj_10 - type_3
obj_08 obj_04 obj_06 obj_11 - type_1
obj_03 obj_05 obj_07 - object)
(:init
(pred_1 obj_12 obj_06)
(pred_3 obj_12 obj_09)
(pred_3 obj_12 obj_13)
(pred_1 obj_01 obj_11)
(pred_3 obj_01 obj_02)
(pred_3 obj_01 obj_10)
(pred_4 obj_03 obj_06)
(pred_4 obj_05 obj_04)
(pred_4 obj_07 obj_08)
)
(:goal
(and
(pred_4 obj_03 obj_11)
(pred_4 obj_05 obj_04)
(pred_4 obj_07 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_12 obj_11) (pred_1 obj_01 obj_11))))
  )
)
)