(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_10 - type_1
obj_08 obj_07 obj_12 obj_03 - type_3
obj_01 obj_09 obj_13 obj_11 - type_2
obj_05 obj_06 obj_04 obj_02 - object)
(:init
(pred_4 obj_14 obj_13)
(pred_2 obj_14 obj_08)
(pred_2 obj_14 obj_07)
(pred_4 obj_10 obj_01)
(pred_2 obj_10 obj_12)
(pred_2 obj_10 obj_03)
(pred_3 obj_05 obj_13)
(pred_3 obj_06 obj_13)
(pred_3 obj_04 obj_13)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_05 obj_09)
(pred_3 obj_06 obj_13)
(pred_3 obj_04 obj_01)
(pred_3 obj_02 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_14 obj_13) (pred_4 obj_10 obj_13))))
  )
)
)