(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_14 - type_1
obj_08 obj_01 obj_06 obj_04 - type_3
obj_07 obj_12 obj_09 obj_11 - type_2
obj_05 obj_02 obj_03 obj_13 - object)
(:init
(pred_2 obj_10 obj_12)
(pred_1 obj_10 obj_08)
(pred_1 obj_10 obj_01)
(pred_2 obj_14 obj_07)
(pred_1 obj_14 obj_06)
(pred_1 obj_14 obj_04)
(pred_3 obj_05 obj_12)
(pred_3 obj_02 obj_12)
(pred_3 obj_03 obj_12)
(pred_3 obj_13 obj_07)
)
(:goal
(and
(pred_3 obj_05 obj_11)
(pred_3 obj_02 obj_09)
(pred_3 obj_03 obj_12)
(pred_3 obj_13 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_10 obj_11) (pred_2 obj_14 obj_11))))
  )
)
)