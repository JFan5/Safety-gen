(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_07 obj_06 obj_01 obj_09 - type_3
obj_08 obj_10 obj_03 - type_2
obj_05 obj_11 - object)
(:init
(pred_4 obj_02 obj_10)
(pred_2 obj_02 obj_07)
(pred_2 obj_02 obj_06)
(pred_4 obj_04 obj_08)
(pred_2 obj_04 obj_01)
(pred_2 obj_04 obj_09)
(pred_3 obj_05 obj_08)
(pred_3 obj_11 obj_08)
)
(:goal
(and
(pred_3 obj_05 obj_10)
(pred_3 obj_11 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_10) (pred_4 obj_04 obj_10))))
  )
)
)