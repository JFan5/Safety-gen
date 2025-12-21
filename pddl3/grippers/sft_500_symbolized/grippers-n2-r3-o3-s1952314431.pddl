(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_12 obj_07 obj_01 obj_10 - type_2
obj_06 obj_11 obj_09 - type_3
obj_03 obj_05 obj_08 - object)
(:init
(pred_1 obj_02 obj_11)
(pred_3 obj_02 obj_12)
(pred_3 obj_02 obj_07)
(pred_1 obj_04 obj_06)
(pred_3 obj_04 obj_01)
(pred_3 obj_04 obj_10)
(pred_2 obj_03 obj_06)
(pred_2 obj_05 obj_09)
(pred_2 obj_08 obj_06)
)
(:goal
(and
(pred_2 obj_03 obj_11)
(pred_2 obj_05 obj_09)
(pred_2 obj_08 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_11) (pred_1 obj_04 obj_11))))
  )
)
)