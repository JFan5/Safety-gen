(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_3
obj_12 obj_03 obj_01 obj_13 - type_1
obj_09 obj_06 obj_05 obj_11 - type_2
obj_07 obj_02 obj_04 - object)
(:init
(pred_2 obj_10 obj_09)
(pred_1 obj_10 obj_12)
(pred_1 obj_10 obj_03)
(pred_2 obj_08 obj_11)
(pred_1 obj_08 obj_01)
(pred_1 obj_08 obj_13)
(pred_4 obj_07 obj_06)
(pred_4 obj_02 obj_05)
(pred_4 obj_04 obj_11)
)
(:goal
(and
(pred_4 obj_07 obj_05)
(pred_4 obj_02 obj_11)
(pred_4 obj_04 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_10 obj_05) (pred_2 obj_08 obj_05))))
    (always (not (and (pred_2 obj_10 obj_11) (pred_2 obj_08 obj_11))))
  )
)
)